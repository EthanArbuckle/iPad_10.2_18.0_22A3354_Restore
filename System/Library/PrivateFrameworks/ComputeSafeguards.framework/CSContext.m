@implementation CSContext

- (CSContext)initWithIdentifier:(id)a3 andState:(id)a4
{
  id v7;
  id v8;
  CSContext *v9;
  CSContext *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CSContext;
  v9 = -[CSContext init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_state, a4);
  }

  return v10;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CSContext: %@, %@"), self->_identifier, self->_state);
}

- (BOOL)isEqual:(id)a3
{
  CSContext *v4;
  CSContext *v5;
  NSString *identifier;
  void *v7;
  NSNumber *state;
  void *v9;
  char v10;

  v4 = (CSContext *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else if (-[CSContext isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    identifier = self->_identifier;
    -[CSContext identifier](v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqual:](identifier, "isEqual:", v7))
    {
      state = self->_state;
      -[CSContext state](v5, "state");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[NSNumber isEqual:](state, "isEqual:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSNumber)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
