@implementation ASTRequest

- (ASTRequest)init
{
  ASTRequest *v2;
  ASTRequest *v3;
  ASTErrorStatus *v4;
  ASTErrorStatus *error;
  NSDictionary *data;
  NSNumber *currentTest;
  NSNumber *progress;
  NSNumber *estimatedTimeRemaining;
  id completion;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ASTRequest;
  v2 = -[ASTRequest init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_clientStatus = 1;
    v4 = objc_alloc_init(ASTErrorStatus);
    error = v3->_error;
    v3->_error = v4;

    data = v3->_data;
    v3->_data = 0;

    currentTest = v3->_currentTest;
    v3->_currentTest = 0;

    progress = v3->_progress;
    v3->_progress = 0;

    estimatedTimeRemaining = v3->_estimatedTimeRemaining;
    v3->_estimatedTimeRemaining = 0;

    completion = v3->_completion;
    v3->_completion = 0;

  }
  return v3;
}

+ (id)request
{
  return objc_alloc_init((Class)a1);
}

+ (BOOL)isEstimatedTimeRemainingFeatureEnabled
{
  if (isEstimatedTimeRemainingFeatureEnabled_onceToken != -1)
    dispatch_once(&isEstimatedTimeRemainingFeatureEnabled_onceToken, &__block_literal_global_0);
  return isEstimatedTimeRemainingFeatureEnabled_isEnabled;
}

void __52__ASTRequest_isEstimatedTimeRemainingFeatureEnabled__block_invoke()
{
  void *v0;

  if (+[ASTEnvironment isInternalBuild](ASTEnvironment, "isInternalBuild"))
  {
    v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.AppleServiceToolkit"));
    isEstimatedTimeRemainingFeatureEnabled_isEnabled = objc_msgSend(v0, "BOOLForKey:", CFSTR("EnableEstimatedTimeRemaining"));

  }
}

- (id)generatePayload
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[6];
  _QWORD v27[8];

  v27[6] = *MEMORY[0x24BDAC8D0];
  if (+[ASTRequest isEstimatedTimeRemainingFeatureEnabled](ASTRequest, "isEstimatedTimeRemainingFeatureEnabled"))
  {
    v26[0] = CFSTR("clientStatus");
    +[ASTRequest stringFromClientStatus:](ASTRequest, "stringFromClientStatus:", -[ASTRequest clientStatus](self, "clientStatus"));
    v3 = objc_claimAutoreleasedReturnValue();
    v27[0] = v3;
    v26[1] = CFSTR("currentTest");
    -[ASTRequest currentTest](self, "currentTest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (uint64_t)v4;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v27[1] = v5;
    v26[2] = CFSTR("progress");
    -[ASTRequest progress](self, "progress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v27[2] = v7;
    v26[3] = CFSTR("estimatedTimeRemaining");
    -[ASTRequest estimatedTimeRemaining](self, "estimatedTimeRemaining", v5, v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v27[3] = v9;
    v26[4] = CFSTR("data");
    -[ASTRequest data](self, "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v27[4] = v11;
    v26[5] = CFSTR("status");
    -[ASTRequest error](self, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27[5] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    if (!v8)

    v16 = v22;
    v15 = v23;
    if (!v6)
LABEL_25:

  }
  else
  {
    v24[0] = CFSTR("clientStatus");
    +[ASTRequest stringFromClientStatus:](ASTRequest, "stringFromClientStatus:", -[ASTRequest clientStatus](self, "clientStatus"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v15;
    v24[1] = CFSTR("currentTest");
    -[ASTRequest currentTest](self, "currentTest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v4;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v25[1] = v16;
    v24[2] = CFSTR("progress");
    -[ASTRequest progress](self, "progress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v25[2] = v7;
    v24[3] = CFSTR("data");
    -[ASTRequest data](self, "data");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (!v17)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v25[3] = v18;
    v24[4] = CFSTR("status");
    -[ASTRequest error](self, "error");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25[4] = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    if (!v6)
      goto LABEL_25;
  }

  if (!v4)
  return v14;
}

- (void)setClientStatus:(int64_t)a3
{
  self->_clientStatus = a3;
  -[ASTSealablePayload setSealed:](self, "setSealed:", 0);
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
  -[ASTSealablePayload setSealed:](self, "setSealed:", 0);
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
  -[ASTSealablePayload setSealed:](self, "setSealed:", 0);
}

- (void)setCurrentTest:(id)a3
{
  objc_storeStrong((id *)&self->_currentTest, a3);
  -[ASTSealablePayload setSealed:](self, "setSealed:", 0);
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
  -[ASTSealablePayload setSealed:](self, "setSealed:", 0);
}

- (void)setEstimatedTimeRemaining:(id)a3
{
  objc_storeStrong((id *)&self->_estimatedTimeRemaining, a3);
  -[ASTSealablePayload setSealed:](self, "setSealed:", 0);
}

- (id)description
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  if (-[ASTSealablePayload isSealed](self, "isSealed"))
  {
    v12.receiver = self;
    v12.super_class = (Class)ASTRequest;
    -[ASTSealablePayload description](&v12, sel_description);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = +[ASTRequest isEstimatedTimeRemainingFeatureEnabled](ASTRequest, "isEstimatedTimeRemainingFeatureEnabled");
    v5 = (void *)MEMORY[0x24BDD17C8];
    +[ASTRequest stringFromClientStatus:](ASTRequest, "stringFromClientStatus:", -[ASTRequest clientStatus](self, "clientStatus"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASTRequest currentTest](self, "currentTest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASTRequest progress](self, "progress");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v4)
    {
      -[ASTRequest estimatedTimeRemaining](self, "estimatedTimeRemaining");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("Client Status: %@, Current Test: %@, Progress: %@, Estimated Time Remaining: %@"), v6, v7, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v5, "stringWithFormat:", CFSTR("Client Status: %@, Current Test: %@, Progress: %@"), v6, v7, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

    return v11;
  }
}

+ (id)stringFromClientStatus:(int64_t)a3
{
  if ((unint64_t)a3 > 0xF)
    return &stru_24F96AF90;
  else
    return off_24F969C50[a3];
}

- (int64_t)clientStatus
{
  return self->_clientStatus;
}

- (ASTErrorStatus)error
{
  return self->_error;
}

- (NSDictionary)data
{
  return self->_data;
}

- (NSNumber)currentTest
{
  return self->_currentTest;
}

- (NSNumber)progress
{
  return self->_progress;
}

- (NSNumber)estimatedTimeRemaining
{
  return self->_estimatedTimeRemaining;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_estimatedTimeRemaining, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_currentTest, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
