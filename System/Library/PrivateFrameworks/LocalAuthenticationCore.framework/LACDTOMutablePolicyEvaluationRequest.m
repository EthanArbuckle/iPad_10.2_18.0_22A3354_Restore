@implementation LACDTOMutablePolicyEvaluationRequest

- (LACDTOMutablePolicyEvaluationRequest)initWithIdentifier:(id)a3
{
  id v4;
  LACDTOMutablePolicyEvaluationRequest *v5;
  LACDTOMutablePolicyEvaluationRequest *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LACDTOMutablePolicyEvaluationRequest;
  v5 = -[LACDTOMutablePolicyEvaluationRequest init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[LACDTOMutablePolicyEvaluationRequest setIdentifier:](v5, "setIdentifier:", v4);

  return v6;
}

- (BOOL)isInteractiveRatchetEvaluation
{
  NSDictionary *options;
  void *v4;
  void *v5;
  BOOL v6;

  options = self->_options;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1000);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](options, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_msgSend(v5, "BOOLValue") & 1) == 0 && self->_policy == 1026;

  return v6;
}

- (NSString)description
{
  void *v3;
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
  void *v16;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[5];

  v21[4] = *MEMORY[0x24BDAC8D0];
  v19 = (void *)MEMORY[0x24BDD17C8];
  v18 = objc_opt_class();
  v3 = (void *)MEMORY[0x24BDD17C8];
  -[LACDTOMutablePolicyEvaluationRequest identifier](self, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("identifier: %@"), v20);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v4;
  v5 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromLACPolicy(-[LACDTOMutablePolicyEvaluationRequest policy](self, "policy"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("policy: %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v7;
  v8 = (void *)MEMORY[0x24BDD17C8];
  -[LACDTOMutablePolicyEvaluationRequest options](self, "options");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("options: %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v10;
  v11 = (void *)MEMORY[0x24BDD17C8];
  -[LACDTOMutablePolicyEvaluationRequest environment](self, "environment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("environment: %@"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "componentsJoinedByString:", CFSTR("; "));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("<%@ %p; %@>"), v18, self, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v16;
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
  int64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_257086B30))
  {
    v5 = v4;
    -[LACDTOMutablePolicyEvaluationRequest identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[LACDTOMutablePolicyEvaluationRequest identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v11)
        goto LABEL_10;
    }
    v13 = -[LACDTOMutablePolicyEvaluationRequest policy](self, "policy");
    if (v13 == objc_msgSend(v5, "policy"))
    {
      -[LACDTOMutablePolicyEvaluationRequest options](self, "options");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "options");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

      }
      else
      {
        v16 = (void *)v15;
        -[LACDTOMutablePolicyEvaluationRequest options](self, "options");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "options");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "isEqualToDictionary:", v18);

        if (!v19)
          goto LABEL_10;
      }
      -[LACDTOMutablePolicyEvaluationRequest environment](self, "environment");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "environment");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v20 == (void *)v21)
      {
        v12 = 1;
        v22 = v20;
      }
      else
      {
        v22 = (void *)v21;
        -[LACDTOMutablePolicyEvaluationRequest environment](self, "environment");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "environment");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v23, "isEqual:", v24);

      }
      goto LABEL_16;
    }
LABEL_10:
    v12 = 0;
LABEL_16:

    goto LABEL_17;
  }
  v12 = 0;
LABEL_17:

  return v12;
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  v3 = -[LACDTOMutablePolicyEvaluationRequest policy](self, "policy");
  -[LACDTOMutablePolicyEvaluationRequest options](self, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  -[LACDTOMutablePolicyEvaluationRequest identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[LACDTOMutablePolicyEvaluationRequest environment](self, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");

  return v9;
}

- (int64_t)policy
{
  return self->_policy;
}

- (void)setPolicy:(int64_t)a3
{
  self->_policy = a3;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (LACDTOEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_environment, a3);
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_storeStrong((id *)&self->_payload, a3);
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
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
