@implementation CCSQLCommandClause

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_clause, 0);
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (NSString)clause
{
  return self->_clause;
}

- (CCSQLCommandClause)initWithClause:(id)a3 parameters:(id)a4
{
  id v6;
  id v7;
  CCSQLCommandClause *v8;
  uint64_t v9;
  NSString *clause;
  uint64_t v11;
  NSArray *parameters;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CCSQLCommandClause;
  v8 = -[CCSQLCommandClause init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    clause = v8->_clause;
    v8->_clause = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    parameters = v8->_parameters;
    v8->_parameters = (NSArray *)v11;

  }
  return v8;
}

- (CCSQLCommandClause)init
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
  v6.super_class = (Class)CCSQLCommandClause;
  -[CCSQLCommandClause description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" clause: %@, parameters: %@"), self->_clause, self->_parameters);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
