@implementation CCSQLCommandOrder

- (CCSQLCommandOrder)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (CCSQLCommandOrder)initWithOrderMode:(int64_t)a3 columnNames:(id)a4
{
  id v6;
  CCSQLCommandOrder *v7;
  CCSQLCommandOrder *v8;
  uint64_t v9;
  NSArray *columnNames;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CCSQLCommandOrder;
  v7 = -[CCSQLCommandOrder init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_orderMode = a3;
    v9 = objc_msgSend(v6, "copy");
    columnNames = v8->_columnNames;
    v8->_columnNames = (NSArray *)v9;

  }
  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CCSQLCommandOrder;
  -[CCSQLCommandOrder description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_orderMode);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" orderMode: %@, columnNames: %@"), v4, self->_columnNames);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5[1] = self->_orderMode;
  v6 = -[NSArray copyWithZone:](self->_columnNames, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  return v5;
}

- (int64_t)orderMode
{
  return self->_orderMode;
}

- (NSArray)columnNames
{
  return self->_columnNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnNames, 0);
}

@end
