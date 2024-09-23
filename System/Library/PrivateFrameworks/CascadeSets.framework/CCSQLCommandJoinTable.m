@implementation CCSQLCommandJoinTable

- (NSString)table
{
  return self->_table;
}

- (CCSQLCommandJoinCriterion)joinCriterion
{
  return self->_joinCriterion;
}

- (CCSQLCommandJoinTable)initWithTable:(id)a3 joinCriterion:(id)a4
{
  id v6;
  id v7;
  CCSQLCommandJoinTable *v8;
  uint64_t v9;
  NSString *table;
  uint64_t v11;
  CCSQLCommandJoinCriterion *joinCriterion;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CCSQLCommandJoinTable;
  v8 = -[CCSQLCommandJoinTable init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    table = v8->_table;
    v8->_table = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    joinCriterion = v8->_joinCriterion;
    v8->_joinCriterion = (CCSQLCommandJoinCriterion *)v11;

  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_joinCriterion, 0);
  objc_storeStrong((id *)&self->_table, 0);
}

- (CCSQLCommandJoinTable)init
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
  v6.super_class = (Class)CCSQLCommandJoinTable;
  -[CCSQLCommandJoinTable description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" table: %@, criterion: %@"), self->_table, self->_joinCriterion);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
