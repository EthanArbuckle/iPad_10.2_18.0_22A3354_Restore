@implementation ASTConnectionSelectSelfServiceSuite

- (ASTConnectionSelectSelfServiceSuite)initWithSuiteID:(id)a3
{
  id v4;
  ASTConnectionSelectSelfServiceSuite *v5;
  ASTConnectionSelectSelfServiceSuite *v6;
  uint64_t v7;
  NSDictionary *rawBody;
  objc_super v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASTConnectionSelectSelfServiceSuite;
  v5 = -[ASTMaterializedConnection init](&v10, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v11 = CFSTR("suiteId");
    v12[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v7 = objc_claimAutoreleasedReturnValue();
    rawBody = v6->_rawBody;
    v6->_rawBody = (NSDictionary *)v7;

    -[ASTMaterializedConnection addBody:](v6, "addBody:", v6->_rawBody);
  }

  return v6;
}

- (id)endpoint
{
  return CFSTR("select/suite");
}

- (id)rawBody
{
  return self->_rawBody;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawBody, 0);
}

@end
