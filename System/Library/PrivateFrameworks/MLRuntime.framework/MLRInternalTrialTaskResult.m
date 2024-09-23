@implementation MLRInternalTrialTaskResult

- (MLRInternalTrialTaskResult)initWithJSONResult:(id)a3
{
  id v5;
  MLRInternalTrialTaskResult *v6;
  MLRInternalTrialTaskResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLRInternalTrialTaskResult;
  v6 = -[MLRInternalTrialTaskResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_JSONResult, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *JSONResult;

  JSONResult = self->_JSONResult;
  if (JSONResult)
    objc_msgSend(a3, "encodeObject:forKey:", JSONResult, CFSTR("JSONResult"));
}

- (MLRInternalTrialTaskResult)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  MLRInternalTrialTaskResult *v12;

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

  v12 = -[MLRInternalTrialTaskResult initWithJSONResult:](self, "initWithJSONResult:", v11);
  return v12;
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
