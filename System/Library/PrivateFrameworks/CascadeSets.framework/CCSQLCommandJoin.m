@implementation CCSQLCommandJoin

- (int64_t)joinType
{
  return self->_joinType;
}

- (NSArray)joinTables
{
  return self->_joinTables;
}

- (CCSQLCommandJoin)initWithJoinType:(int64_t)a3 joinTables:(id)a4
{
  id v7;
  CCSQLCommandJoin *v8;
  CCSQLCommandJoin *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CCSQLCommandJoin;
  v8 = -[CCSQLCommandJoin init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_joinType = a3;
    objc_storeStrong((id *)&v8->_joinTables, a4);
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_joinTables, 0);
}

- (CCSQLCommandJoin)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CCSQLCommandJoin;
  -[CCSQLCommandJoin description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" joinTables: %@"), self->_joinTables);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
