@implementation ML3MigrationAddedColumn

- (ML3MigrationAddedColumn)initWithName:(id)a3 foreignTable:(id)a4 foreignColumn:(id)a5 joinColumn:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ML3MigrationAddedColumn *v15;
  ML3MigrationAddedColumn *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ML3MigrationAddedColumn;
  v15 = -[ML3MigrationAddedColumn init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_columnName, a3);
    objc_storeStrong((id *)&v16->_foreignTableName, a4);
    objc_storeStrong((id *)&v16->_foreignColumnName, a5);
    objc_storeStrong((id *)&v16->_joinColumnName, a6);
  }

  return v16;
}

- (BOOL)shouldImportFromForeignTable
{
  return self->_foreignColumnName != 0;
}

- (NSString)columnName
{
  return self->_columnName;
}

- (NSString)foreignTableName
{
  return self->_foreignTableName;
}

- (NSString)foreignColumnName
{
  return self->_foreignColumnName;
}

- (NSString)joinColumnName
{
  return self->_joinColumnName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_joinColumnName, 0);
  objc_storeStrong((id *)&self->_foreignColumnName, 0);
  objc_storeStrong((id *)&self->_foreignTableName, 0);
  objc_storeStrong((id *)&self->_columnName, 0);
}

@end
