@implementation LACDTOMutablePolicyEvaluationResult

- (LACDTOMutablePolicyEvaluationResult)initWithIdentifier:(id)a3
{
  id v4;
  LACDTOMutablePolicyEvaluationResult *v5;
  LACDTOMutablePolicyEvaluationResult *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LACDTOMutablePolicyEvaluationResult;
  v5 = -[LACDTOMutablePolicyEvaluationResult init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[LACDTOMutablePolicyEvaluationResult setIdentifier:](v5, "setIdentifier:", v4);

  return v6;
}

- (BOOL)isSuccess
{
  void *v2;
  BOOL v3;

  -[LACDTOMutablePolicyEvaluationResult result](self, "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSString)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  v17 = (void *)MEMORY[0x24BDD17C8];
  v3 = objc_opt_class();
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[LACDTOMutablePolicyEvaluationResult identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("identifier: %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  v7 = (void *)MEMORY[0x24BDD17C8];
  -[LACDTOMutablePolicyEvaluationResult result](self, "result");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("result: %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v9;
  v10 = (void *)MEMORY[0x24BDD17C8];
  -[LACDTOMutablePolicyEvaluationResult error](self, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("error: %@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "componentsJoinedByString:", CFSTR("; "));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@ %p; %@>"), v3, self, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_257082B58))
  {
    v5 = v4;
    -[LACDTOMutablePolicyEvaluationResult identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[LACDTOMutablePolicyEvaluationResult identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v11)
        goto LABEL_9;
    }
    -[LACDTOMutablePolicyEvaluationResult result](self, "result");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "result");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[LACDTOMutablePolicyEvaluationResult result](self, "result");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "result");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
      {
LABEL_9:
        v12 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    -[LACDTOMutablePolicyEvaluationResult error](self, "error");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "error");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {
      v12 = 1;
      v21 = v19;
    }
    else
    {
      v21 = (void *)v20;
      -[LACDTOMutablePolicyEvaluationResult error](self, "error");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "error");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v22, "isEqual:", v23);

    }
    goto LABEL_15;
  }
  v12 = 0;
LABEL_16:

  return v12;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSDictionary)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
