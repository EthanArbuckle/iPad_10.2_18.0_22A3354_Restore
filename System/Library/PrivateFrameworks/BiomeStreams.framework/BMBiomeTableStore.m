@implementation BMBiomeTableStore

- (BMBiomeTableStore)initWithURL:(id)a3 tableName:(id)a4 identifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  BMBiomeTableStore *v12;
  uint64_t v13;
  NSString *identifier;
  uint64_t v15;
  NSString *tableName;
  uint64_t v17;
  BMTableStore *tableStore;
  void *v20;
  void *v21;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)BMBiomeTableStore;
  v12 = -[BMBiomeTableStore init](&v22, sel_init);
  if (v12)
  {
    if (v10)
    {
      if (v9)
      {
LABEL_4:
        v13 = objc_msgSend(v11, "copy");
        identifier = v12->_identifier;
        v12->_identifier = (NSString *)v13;

        v15 = objc_msgSend(v10, "copy");
        tableName = v12->_tableName;
        v12->_tableName = (NSString *)v15;

        v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0D01C10]), "initWithURL:", v9);
        tableStore = v12->_tableStore;
        v12->_tableStore = (BMTableStore *)v17;

        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("BMBiomeTableStore.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tableName"));

      if (v9)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("BMBiomeTableStore.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url"));

    goto LABEL_4;
  }
LABEL_5:

  return v12;
}

- (BMBiomeTableStore)initWithIdentifier:(id)a3 tableName:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  BMBiomeTableStore *v12;

  v6 = (void *)MEMORY[0x1E0D01C20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "directoryForPrivateTable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D01C20], "privateDBPathWithIdentifier:directory:create:", v8, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[BMBiomeTableStore initWithURL:tableName:identifier:](self, "initWithURL:tableName:identifier:", v11, v7, v8);

  return v12;
}

- (id)select:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[BMBiomeTableStore tableName](self, "tableName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMBiomeTableStore selectTableNamed:](self, "selectTableNamed:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x1E0D01BF8]);
  v8 = (void *)objc_msgSend(v7, "initWithChildren:columnNames:", MEMORY[0x1E0C9AA60], v4);

  objc_msgSend(v8, "queryTable:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)selectTableNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[BMBiomeTableStore tableStore](self, "tableStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectTableNamed:error:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (BMTableStore)tableStore
{
  return self->_tableStore;
}

- (void)setTableStore:(id)a3
{
  objc_storeStrong((id *)&self->_tableStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableStore, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
