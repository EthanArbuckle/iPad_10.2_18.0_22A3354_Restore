@implementation MLRTrialTaskResult

- (MLRTrialTaskResult)initWithJSONResult:(id)a3
{
  id v5;
  MLRTrialTaskResult *v6;
  MLRTrialTaskResult *v7;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MLRTrialTaskResult;
  v6 = -[MLRTrialTaskResult init](&v13, sel_init);
  if (v6)
  {
    if (v5 && (objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v5) & 1) == 0)
    {
      v9 = (void *)MEMORY[0x24BDBCE88];
      v10 = *MEMORY[0x24BDBCAB8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("JSONResult must be valid JSON object, JSONResult=(%@)"), v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v11, 0);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v12);
    }
    objc_storeStrong((id *)&v6->_JSONResult, a3);
    v7 = v6;
  }

  return v6;
}

- (BOOL)submitForTask:(id)a3 error:(id *)a4
{
  return 1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\nJSONResult:\n\t%@\n"), v5, self->_JSONResult);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDictionary)JSONResult
{
  return self->_JSONResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_JSONResult, 0);
}

@end
