@implementation INIntentTestResult

- (INIntentTestResult)initWithResolvedIntent:(id)a3 resolvedParameters:(id)a4 resolvedAllParametersSuccesfully:(BOOL)a5 confirmResponse:(id)a6 handleResponse:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  INIntentTestResult *v16;
  uint64_t v17;
  INIntent *resolvedIntent;
  uint64_t v19;
  NSDictionary *resolvedParameters;
  objc_super v22;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)INIntentTestResult;
  v16 = -[INIntentTestResult init](&v22, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    resolvedIntent = v16->_resolvedIntent;
    v16->_resolvedIntent = (INIntent *)v17;

    v19 = objc_msgSend(v13, "copy");
    resolvedParameters = v16->_resolvedParameters;
    v16->_resolvedParameters = (NSDictionary *)v19;

    v16->_resolvedAllParametersSuccesfully = a5;
    objc_storeStrong((id *)&v16->_confirmResponse, a6);
    objc_storeStrong((id *)&v16->_handleResponse, a7);
  }

  return v16;
}

- (id)description
{
  return -[INIntentTestResult descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INIntentTestResult;
  -[INIntentTestResult description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentTestResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dictionaryRepresentation
{
  INIntent *resolvedIntent;
  void *v4;
  NSDictionary *resolvedParameters;
  void *v6;
  void *v7;
  INIntentResponse *confirmResponse;
  void *v9;
  INIntentResponse *handleResponse;
  void *v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("resolvedIntent");
  resolvedIntent = self->_resolvedIntent;
  v4 = resolvedIntent;
  if (!resolvedIntent)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[0] = v4;
  v14[1] = CFSTR("resolvedParameters");
  resolvedParameters = self->_resolvedParameters;
  v6 = resolvedParameters;
  if (!resolvedParameters)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[1] = v6;
  v14[2] = CFSTR("resolvedAllParametersSuccesfully");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_resolvedAllParametersSuccesfully);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v7;
  v14[3] = CFSTR("confirmResponse");
  confirmResponse = self->_confirmResponse;
  v9 = confirmResponse;
  if (!confirmResponse)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[3] = v9;
  v14[4] = CFSTR("handleResponse");
  handleResponse = self->_handleResponse;
  v11 = handleResponse;
  if (!handleResponse)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[4] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (handleResponse)
  {
    if (confirmResponse)
      goto LABEL_11;
  }
  else
  {

    if (confirmResponse)
      goto LABEL_11;
  }

LABEL_11:
  if (!resolvedParameters)
  {

    if (resolvedIntent)
      return v12;
LABEL_17:

    return v12;
  }
  if (!resolvedIntent)
    goto LABEL_17;
  return v12;
}

- (INIntent)resolvedIntent
{
  return self->_resolvedIntent;
}

- (NSDictionary)resolvedParameters
{
  return self->_resolvedParameters;
}

- (BOOL)resolvedAllParametersSuccesfully
{
  return self->_resolvedAllParametersSuccesfully;
}

- (INIntentResponse)confirmResponse
{
  return self->_confirmResponse;
}

- (INIntentResponse)handleResponse
{
  return self->_handleResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleResponse, 0);
  objc_storeStrong((id *)&self->_confirmResponse, 0);
  objc_storeStrong((id *)&self->_resolvedParameters, 0);
  objc_storeStrong((id *)&self->_resolvedIntent, 0);
}

@end
