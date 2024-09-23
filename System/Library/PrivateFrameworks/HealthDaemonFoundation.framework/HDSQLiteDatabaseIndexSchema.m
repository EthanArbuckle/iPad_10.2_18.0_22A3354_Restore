@implementation HDSQLiteDatabaseIndexSchema

- (unint64_t)hash
{
  return -[NSArray hash](self->_columns, "hash") ^ self->_isUnique;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSArray *columns;
  NSArray *v6;
  BOOL v7;

  v4 = a3;
  columns = self->_columns;
  v6 = (NSArray *)v4[3];
  if (columns == v6 || v6 && -[NSArray isEqual:](columns, "isEqual:"))
    v7 = self->_isUnique ^ (*((_BYTE *)v4 + 8) == 0);
  else
    v7 = 0;

  return v7;
}

- (id)description
{
  void *v2;
  const __CFString *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD16A8];
  if (self->_isUnique)
    v3 = CFSTR("UNIQUE");
  else
    v3 = CFSTR("INDEX");
  -[NSArray componentsJoinedByString:](self->_columns, "componentsJoinedByString:", CFSTR(", "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ (%@)"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)columns
{
  return self->_columns;
}

- (void)setColumns:(id)a3
{
  objc_storeStrong((id *)&self->_columns, a3);
}

- (BOOL)isUnique
{
  return self->_isUnique;
}

- (void)setIsUnique:(BOOL)a3
{
  self->_isUnique = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
