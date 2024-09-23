@implementation ASTConnectionTestResult

- (ASTConnectionTestResult)initWithTestResults:(id)a3
{
  id v4;
  ASTConnectionTestResult *v5;
  uint64_t v6;
  NSNumber *testId;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASTConnectionTestResult;
  v5 = -[ASTMaterializedConnection init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "testId");
    v6 = objc_claimAutoreleasedReturnValue();
    testId = v5->_testId;
    v5->_testId = (NSNumber *)v6;

    objc_msgSend(v4, "payload");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "payload");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASTMaterializedConnection addBody:gzip:](v5, "addBody:gzip:", v9, +[ASTConnectionUtilities isGzipEnabled](ASTConnectionUtilities, "isGzipEnabled"));

      objc_msgSend(v4, "base64Signature");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASTMaterializedConnection setSignature:](v5, "setSignature:", v10);

    }
  }

  return v5;
}

- (id)endpoint
{
  return CFSTR("results");
}

- (NSNumber)testId
{
  return self->_testId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testId, 0);
}

@end
