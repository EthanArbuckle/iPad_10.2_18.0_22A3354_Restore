@implementation BMTable

- (BMTable)initWithRows:(id)a3 schema:(id)a4
{
  id v6;
  id v7;
  BMTable *v8;
  uint64_t v9;
  NSArray *rows;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMTable;
  v8 = -[BMTable init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    rows = v8->_rows;
    v8->_rows = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_schema, a4);
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[BMTable schema](self, "schema");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMTable rows](self, "rows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Schema: %@  | Rows: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)rows
{
  return self->_rows;
}

- (void)setRows:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (BMTableSchema)schema
{
  return self->_schema;
}

- (void)setSchema:(id)a3
{
  objc_storeStrong((id *)&self->_schema, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schema, 0);
  objc_storeStrong((id *)&self->_rows, 0);
}

@end
