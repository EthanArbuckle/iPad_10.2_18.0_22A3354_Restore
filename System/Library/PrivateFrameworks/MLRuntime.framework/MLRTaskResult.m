@implementation MLRTaskResult

- (MLRTaskResult)initWithJSONResult:(id)a3 unprivatizedVector:(id)a4
{
  id v7;
  id v8;
  MLRTaskResult *v9;
  MLRTaskResult *v10;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MLRTaskResult;
  v9 = -[MLRTaskResult init](&v16, sel_init);
  if (v9)
  {
    if (v7 && (objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v7) & 1) == 0)
    {
      v12 = (void *)MEMORY[0x24BDBCE88];
      v13 = *MEMORY[0x24BDBCAB8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("JSONResult must be valid JSON object, JSONResult=(%@)"), v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, v14, 0);
      v15 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v15);
    }
    objc_storeStrong((id *)&v9->_vector, a4);
    objc_storeStrong((id *)&v9->_JSONResult, a3);
    v10 = v9;
  }

  return v9;
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSDictionary *JSONResult;
  NSData *vector;
  id v7;

  v4 = a3;
  JSONResult = self->_JSONResult;
  v7 = v4;
  if (JSONResult)
  {
    objc_msgSend(v4, "encodeObject:forKey:", JSONResult, CFSTR("JSONResult"));
    v4 = v7;
  }
  vector = self->_vector;
  if (vector)
  {
    objc_msgSend(v7, "encodeObject:forKey:", vector, CFSTR("vector"));
    v4 = v7;
  }

}

- (MLRTaskResult)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  MLRTaskResult *v13;

  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v10, CFSTR("JSONResult"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vector"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[MLRTaskResult initWithJSONResult:unprivatizedVector:](self, "initWithJSONResult:unprivatizedVector:", v11, v12);
  return v13;
}

- (NSDictionary)JSONResult
{
  return self->_JSONResult;
}

- (NSData)vector
{
  return self->_vector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vector, 0);
  objc_storeStrong((id *)&self->_JSONResult, 0);
}

@end
