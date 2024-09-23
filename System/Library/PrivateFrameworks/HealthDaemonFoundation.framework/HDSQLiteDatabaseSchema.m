@implementation HDSQLiteDatabaseSchema

- (unint64_t)hash
{
  return -[NSDictionary hash](self->_tables, "hash");
}

- (BOOL)isEqual:(id)a3
{
  NSDictionary *tables;
  NSDictionary *v4;

  tables = self->_tables;
  v4 = (NSDictionary *)*((_QWORD *)a3 + 1);
  if (tables == v4)
    return 1;
  if (v4)
    return -[NSDictionary isEqual:](tables, "isEqual:");
  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v9.receiver = self;
  v9.super_class = (Class)HDSQLiteDatabaseSchema;
  -[HDSQLiteDatabaseSchema description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary allValues](self->_tables, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("\n"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: \n%@\n>"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSDictionary)tables
{
  return self->_tables;
}

- (void)setTables:(id)a3
{
  objc_storeStrong((id *)&self->_tables, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tables, 0);
}

@end
