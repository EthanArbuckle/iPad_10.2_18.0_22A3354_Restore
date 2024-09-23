@implementation LACEvaluationResult

- (LACEvaluationResult)initWithValue:(id)a3 error:(id)a4 request:(id)a5
{
  id v9;
  id v10;
  id v11;
  LACEvaluationResult *v12;
  LACEvaluationResult *v13;
  uint64_t v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)LACEvaluationResult;
  v12 = -[LACEvaluationResult init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_value, a3);
    objc_storeStrong((id *)&v13->_error, a4);
    objc_storeStrong((id *)&v13->_request, a5);
    if (v9)
    {
      v14 = 2;
LABEL_8:
      v13->_rawValue = v14;
      goto LABEL_9;
    }
    if (v10)
    {
      v14 = 0;
      goto LABEL_8;
    }
    if (v11)
    {
      v14 = 1;
      goto LABEL_8;
    }
  }
LABEL_9:

  return v13;
}

+ (id)resultWithNext:(id)a3
{
  id v3;
  LACEvaluationResult *v4;

  v3 = a3;
  v4 = -[LACEvaluationResult initWithValue:error:request:]([LACEvaluationResult alloc], "initWithValue:error:request:", 0, 0, v3);

  return v4;
}

+ (id)resultWithSuccess:(id)a3
{
  id v3;
  LACEvaluationResult *v4;

  v3 = a3;
  v4 = -[LACEvaluationResult initWithValue:error:request:]([LACEvaluationResult alloc], "initWithValue:error:request:", v3, 0, 0);

  return v4;
}

+ (id)resultWithFailure:(id)a3
{
  id v3;
  LACEvaluationResult *v4;

  v3 = a3;
  v4 = -[LACEvaluationResult initWithValue:error:request:]([LACEvaluationResult alloc], "initWithValue:error:request:", 0, v3, 0);

  return v4;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("value: %@"), self->_value);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("error: %@"), self->_error);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("request: %@"), self->_request);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR("; "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; %@>"), v4, self, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  id v7;
  int64_t v8;
  int64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  char v19;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v7 = v4;
    v8 = -[LACEvaluationResult rawValue](self, "rawValue");
    if (v8 != objc_msgSend(v7, "rawValue"))
    {
LABEL_14:
      v15 = 0;
LABEL_17:

      goto LABEL_18;
    }
    v9 = -[LACEvaluationResult rawValue](self, "rawValue");
    if (v9 == 2)
    {
      -[LACEvaluationResult value](self, "value");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "value");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v10 == (void *)v16)
        goto LABEL_15;
      v12 = (void *)v16;
      -[LACEvaluationResult value](self, "value");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "value");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v9 != 1)
      {
        if (v9)
          goto LABEL_16;
        -[LACEvaluationResult error](self, "error");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "error");
        v11 = objc_claimAutoreleasedReturnValue();
        if (v10 != (void *)v11)
        {
          v12 = (void *)v11;
          -[LACEvaluationResult error](self, "error");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "error");
          v14 = objc_claimAutoreleasedReturnValue();
          goto LABEL_13;
        }
LABEL_15:

        goto LABEL_16;
      }
      -[LACEvaluationResult request](self, "request");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "request");
      v17 = objc_claimAutoreleasedReturnValue();
      if (v10 == (void *)v17)
        goto LABEL_15;
      v12 = (void *)v17;
      -[LACEvaluationResult request](self, "request");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "request");
      v14 = objc_claimAutoreleasedReturnValue();
    }
LABEL_13:
    v18 = (void *)v14;
    v19 = objc_msgSend(v13, "isEqual:", v14);

    if ((v19 & 1) == 0)
      goto LABEL_14;
LABEL_16:
    v15 = 1;
    goto LABEL_17;
  }
  v15 = 0;
LABEL_18:

  return v15;
}

- (int64_t)rawValue
{
  return self->_rawValue;
}

- (NSDictionary)value
{
  return self->_value;
}

- (NSError)error
{
  return self->_error;
}

- (LACEvaluationRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end
