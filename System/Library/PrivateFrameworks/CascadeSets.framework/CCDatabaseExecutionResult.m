@implementation CCDatabaseExecutionResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_rowValueTuples, 0);
  objc_storeStrong((id *)&self->_command, 0);
}

- (CCDatabaseExecutionResult)initWithCommand:(id)a3 beginMachTime:(unint64_t)a4 endMachTime:(unint64_t)a5 rowValueTuples:(id)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  CCDatabaseExecutionResult *v15;
  uint64_t v16;
  CCDatabaseCommand *command;
  uint64_t v18;
  NSArray *rowValueTuples;
  uint64_t v20;
  NSError *error;
  objc_super v23;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)CCDatabaseExecutionResult;
  v15 = -[CCDatabaseExecutionResult init](&v23, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    command = v15->_command;
    v15->_command = (CCDatabaseCommand *)v16;

    v15->_beginMachTime = a4;
    v15->_endMachTime = a5;
    v18 = objc_msgSend(v13, "copy");
    rowValueTuples = v15->_rowValueTuples;
    v15->_rowValueTuples = (NSArray *)v18;

    v20 = objc_msgSend(v14, "copy");
    error = v15->_error;
    v15->_error = (NSError *)v20;

  }
  return v15;
}

- (NSError)error
{
  return self->_error;
}

- (NSArray)rowValueTuples
{
  return self->_rowValueTuples;
}

- (CCDatabaseExecutionResult)init
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
  CCDatabaseCommand *command;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v10.receiver = self;
  v10.super_class = (Class)CCDatabaseExecutionResult;
  -[CCDatabaseExecutionResult description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  command = self->_command;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_beginMachTime);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_endMachTime);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {command: %@, beginMachTime: %@, endMachTime: %@, rowValueTuples: %@, error: %@}"), v4, command, v6, v7, self->_rowValueTuples, self->_error);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CCDatabaseCommand)command
{
  return self->_command;
}

- (unint64_t)beginMachTime
{
  return self->_beginMachTime;
}

- (unint64_t)endMachTime
{
  return self->_endMachTime;
}

@end
