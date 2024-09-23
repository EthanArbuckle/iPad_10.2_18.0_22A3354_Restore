@implementation CCDatabaseCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_commandString, 0);
}

- (BOOL)updateParameters:(id)a3
{
  id v4;
  NSUInteger v5;
  uint64_t v6;
  NSArray *v7;
  NSArray *parameters;

  v4 = a3;
  v5 = -[NSArray count](self->_parameters, "count");
  v6 = objc_msgSend(v4, "count");
  if (v5 == v6)
  {
    v7 = (NSArray *)objc_msgSend(v4, "copy");
    parameters = self->_parameters;
    self->_parameters = v7;

  }
  return v5 == v6;
}

- (NSString)commandString
{
  return self->_commandString;
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[NSString copyWithZone:](self->_commandString, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSArray copyWithZone:](self->_parameters, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (CCDatabaseCommand)initWithCommandString:(id)a3 parameters:(id)a4
{
  id v6;
  id v7;
  CCDatabaseCommand *v8;
  uint64_t v9;
  NSString *commandString;
  uint64_t v11;
  NSArray *parameters;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CCDatabaseCommand;
  v8 = -[CCDatabaseCommand init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    commandString = v8->_commandString;
    v8->_commandString = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    parameters = v8->_parameters;
    v8->_parameters = (NSArray *)v11;

  }
  return v8;
}

- (BOOL)updateCommandString:(id)a3
{
  NSString *v4;
  NSString *commandString;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  commandString = self->_commandString;
  self->_commandString = v4;

  return 1;
}

- (void)replaceParameters:(id)a3
{
  NSArray *v4;
  NSArray *parameters;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  parameters = self->_parameters;
  self->_parameters = v4;

}

- (CCDatabaseCommand)init
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
  v6.super_class = (Class)CCDatabaseCommand;
  -[CCDatabaseCommand description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" commandString: %@, parameters: %@"), self->_commandString, self->_parameters);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  CCDatabaseCommand *v4;
  CCDatabaseCommand *v5;
  BOOL v6;

  v4 = (CCDatabaseCommand *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CCDatabaseCommand isEqualToCommand:](self, "isEqualToCommand:", v5);

  return v6;
}

- (BOOL)isEqualToCommand:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  NSString *commandString;
  void *v9;
  int v10;
  char v11;
  NSArray *parameters;
  NSArray *v13;
  void *v14;

  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    v11 = 0;
    goto LABEL_18;
  }
  commandString = self->_commandString;
  v9 = commandString;
  if (!commandString)
  {
    objc_msgSend(v6, "commandString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v10 = 0;
      goto LABEL_10;
    }
    v9 = self->_commandString;
  }
  objc_msgSend(v7, "commandString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqual:", v4) & 1) == 0)
  {

    v11 = 0;
    goto LABEL_16;
  }
  v10 = 1;
LABEL_10:
  parameters = self->_parameters;
  v13 = parameters;
  if (!parameters)
  {
    objc_msgSend(v7, "parameters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v11 = 1;
      goto LABEL_20;
    }
    v13 = self->_parameters;
  }
  objc_msgSend(v7, "parameters");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NSArray isEqual:](v13, "isEqual:", v14);

  if (parameters)
  {
    if (!v10)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_20:

  if ((v10 & 1) != 0)
LABEL_15:

LABEL_16:
  if (!commandString)

LABEL_18:
  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_commandString, "hash");
  -[NSArray description](self->_parameters, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

@end
